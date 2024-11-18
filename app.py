import selenium
from fastapi import FastAPI

# importar webdriver y Service
from selenium import webdriver
from selenium.webdriver.chrome.service import Service

app = FastAPI()
@app.post("/")
def main():

    # inicializar service y agregar las opciones para que funcione selenium headless en colab
    service = Service()
    options = webdriver.ChromeOptions()
    options.add_argument("--headless")
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    driver = webdriver.Chrome(service=service, options=options)
    with driver:
        driver.get("https://wikipedia.com")
        title = driver.title

    print(title)
    return title