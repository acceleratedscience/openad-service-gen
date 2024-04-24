from fastapi import FastAPI, HTTPException, Request, status
from fastapi.responses import HTMLResponse, RedirectResponse, FileResponse
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel
from call_generation_services import service_requester


app = FastAPI()

requester = service_requester()


@app.get("/health", response_class=HTMLResponse)
async def health():
    return "UP"


@app.post("/service")
def service(property_request: dict):
    result = requester.route_service(property_request)

    return result


def main():
    import uvicorn
    import torch

    print(f"\n[i] cuda is available: {torch.cuda.is_available()}\n")
    if torch.cuda.is_available():
        print(f"[i] cuda version: {torch.version.cuda}\n")
    uvicorn.run(app, host="0.0.0.0", port=8090)


if __name__ == "__main__":
    main()
