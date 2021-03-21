FROM python:3

ENV PYTHONUNBUFFERED=1

WORKDIR /code

# Install Python dependency management tools
RUN pip install --upgrade pip
		&& pip install --upgrade setuptools
		&& pip install --upgrade pipenv

# Copy Pipenv dependency files
COPY Pipfile /code/
COPY Pipfile.lock /code/

# Install dependencies, include dev-dependencies, system-wide
RUN pipenv install --deploy --dev --system

COPY . /code/
