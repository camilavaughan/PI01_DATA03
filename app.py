from fastapi import FastAPI
#from routes.user import user

app = FastAPI()

@app.get ("/")
def helloword():
    return "Hello word"
