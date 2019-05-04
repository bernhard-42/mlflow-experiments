# on a German Mac
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set tracking server
export MLFLOW_TRACKING_URI=databricks://westeu

experiment="/Shared/experiments/airbnb-elasticnet"
EXID=$(mlflow experiments list | grep "$experiment" | awk '{print $1}')
if [[ "$EXID" == "" ]]; then 
    echo "Creating experiment"
    EXID=$(mlflow experiments create "$experiment" | awk '{print $NF'})
fi
echo "experiment: $EXID"

if [[ "$2" == "" ]]; then
    echo "parmeters alpha > 0 and 0.01 <= l1_ratio <= 1 missing"
    exit 1
fi

mlflow run . --experiment-id "$EXID" -P alpha=$1 -P l1_ratio=$2
