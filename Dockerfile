FROM python:3.9.12-slim

RUN pip install requests

COPY vxlan.py /vxlan.py
RUN chmod 755 vxlan.py

CMD ["/vxlan.py"]
