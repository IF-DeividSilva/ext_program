chave = int(input())
n=0

while n != chave :
    n = int(input())
    if n > 5:
      print("Maior") 
    if n < 5:
      print("Menor")
    if n == chave:
      print("Ganhou!")
      break