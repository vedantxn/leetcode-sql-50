import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, n: int) -> pd.DataFrame:
    salaries = employee['salary'].drop_duplicates().nlargest(n)
    return pd.DataFrame({f'getNthHighestSalary({n})': [salaries.iloc[-1] if n <= len(salaries) and n > 0 else None]})