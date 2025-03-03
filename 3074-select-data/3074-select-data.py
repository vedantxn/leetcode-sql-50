import pandas as pd

def selectData(students: pd.DataFrame) -> pd.DataFrame:
    newDF = students[students['student_id'] == 101]
    return newDF[['name','age']]