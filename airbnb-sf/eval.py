import sys
import pandas as pd
import numpy as np
import mlflow.sklearn

if len(sys.argv) < 2:
    print("provide run_id")
else:
    run_id = sys.argv[1]
    sk_model = mlflow.sklearn.load_model("model", run_id=run_id)
    print(sk_model)

    df = pd.read_csv("../data/airbnb-cleaned-mlflow.csv").iloc[:3]
    y = df["price"]
    x = df.drop("price", axis=1) 

    predictions = sk_model.predict(x)
    print(predictions)
    print(y)



