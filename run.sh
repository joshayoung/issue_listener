#!/bin/bash
docker run -p 80:4567 --name issues-dashboard-container -it -v "$(pwd)":/app --rm issues-dashboard