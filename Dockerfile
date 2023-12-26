FROM quay.io/astronomer/astro-runtime:9.7.0

COPY providers.txt .
RUN pip install --no-cache-dir --root-user-action=ignore -r providers.txt

WORKDIR "/usr/local/airflow"

COPY dbt/requirements.txt ./dbt-requirements.txt
RUN python -m virtualenv dbt_venv && source dbt_venv/bin/activate && \
    pip install --no-cache-dir -r dbt-requirements.txt && deactivate
