from test as builder
 

from alpine
copy  --from=builder / .
CMD ["cat","/README.md"]
