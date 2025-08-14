#!/bin/bash
echo "🔄 Sorting imports with isort..."
isort .
echo "🖤 Formatting with black..."
black .
echo "✅ Linting with flake8..."
flake8 .
