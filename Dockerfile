FROM jamesthomas/openwhisk_python_ml
RUN pip install Cython==0.28.5 scikit_learn==0.22.2.post1
ADD heartmodel.joblib /pythonAction/

