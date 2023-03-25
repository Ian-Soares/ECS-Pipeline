from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
import requests

app = FastAPI(title="Library API")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

headers = {
    'content-type': "application/json",
    'cache-control': "no-cache"
}

@app.get('/api/get_dog_images')
def get_dog_img():
    URL = 'https://dog.ceo/api/breeds/image/random'
    response = requests.request("GET", URL, headers=headers)
    dog_url = response.json()
    return dog_url