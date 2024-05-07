from fastapi import FastAPI, HTTPException
from fastapi.responses import HTMLResponse, JSONResponse
from call_generation_services import service_requester
import torch
import time

app = FastAPI()

requester = service_requester()


@app.get("/health", response_class=HTMLResponse)
async def health():
    return "UP"


@app.post("/service")
async def service(property_request: dict):
    try:
        start = time.time()
        result = await requester.route_service(property_request)
        print(f"---finished in {time.time()-start:.2f} seconds---")
        torch.cuda.empty_cache()
        return result
    except Exception as e:
        torch.cuda.empty_cache()
        raise HTTPException(status_code=500, detail=str(e))


@app.exception_handler(HTTPException)
async def generic_exception_handler(request, exc):
    return JSONResponse(status_code=exc.status_code, content={"message": exc.detail})


def main():
    import uvicorn
    import torch

    print(f"\n[i] cuda is available: {torch.cuda.is_available()}\n")
    if torch.cuda.is_available():
        print(f"[i] cuda version: {torch.version.cuda}\n")
    uvicorn.run(app, host="0.0.0.0", port=8080)


if __name__ == "__main__":
    main()
