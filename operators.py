# Arithmetic Operators
a = 10
b = 10
print ("Arithmetic Operators:")
print(f"{'Operator':20} {'a':<5} {'b':<5} {'Result':<5}")
print(f"{'Addition':20} {a:<5} {b:<5} {a + b:<5}")
print(f"{'Subtraction':20} {a:<5} {b:<5} {a - b:<5}")
print(f"{'Multiplication':20} {a:<5} {b:<5} {a * b:<5}")  
print(f"{'Division':20} {a:<5} {b:<5} {a / b:<5}")
print(f"{'Floor Division':20} {a:<5} {b:<5} {a // b:<5}")
print(f"{'Modulus':20} {a:<5} {b:<5} {a % b:<5}")
print(f"{'Exponentiation':20} {a:<5} {b:<5} {a ** b:<5} {'\n'}") 

# Relational Operators
c = 5
d = 10
print ("Relational Operators:")
print(f"{'Operator':25} {'c':<5} {'d':<5} {'Result':<5}")
print(f"{'Equal to':25} {c:<5} {d:<5} {c == d}")
print(f"{'Not equal to':25} {c:<5} {d:<5} {c != d}")
print(f"{'Greater than':25} {c:<5} {d:<5} {c > d}")
print(f"{'Less than':25} {c:<5} {d:<5} {c < d}")
print(f"{'Greater than or equal to':25} {c:<5} {d:<5} {c >= d}")
print(f"{'Less than or equal to':25} {c:<5} {d:<5} {c <= d} {'\n'}")

# Logical Operators
e = True
f = False
print ("Logical Operators:")
print(f"{'Operator':20} {'e':<5} {'f':<5} {'Result':<5}")
print(f"{'AND':20} {str(e):<5} {str(f):<5} {e and f}")
print(f"{'OR':20} {str(e):<5} {str(f):<5} {e or f}")
print(f"{'NOT':20} {str(e):<5} {'-':<5} {not e}")
print(f"{'NOT':20} {'-':<5} {str(f):<5} {not f} {'\n'}")

# Bitwise Operators
g = 10  # 1010 in binary
h = 4   # 0100 in binary
print ("Bitwise Operators:")
print(f"{'Operator':20} {'g':<5} {'h':<5} {'Result':<5}")
print(f"{'Bitwise AND':20} {g:<5} {h:<5} {g & h}")
print(f"{'Bitwise OR':20} {g:<5} {h:<5} {g | h}")
print(f"{'Bitwise XOR':20} {g:<5} {h:<5} {g ^ h}")
print(f"{'Bitwise NOT':20} {g:<5} {'-':<5} {~g}")
print(f"{'Bitwise Left Shift':20} {g:<5} {'-':<5} {g << 2}")
print(f"{'Bitwise Right Shift':20} {g:<5} {'-':<5} {g >> 2} {'\n'}")

# Assignment Operators
i = 5
print ("Assignment Operators:")
print(f"{'Operator':20} {'i':<5} {'Result':<5}")
print(f"{'Assign':20} {i:<5} {i}")
i += 10
print(f"{'Add and assign':20} {i:<5} {i}")
i -= 5
print(f"{'Subtract and assign':20} {i:<5} {i} {'\n'}")

# Indentity Operators
j = 10
k = 20
print ("Identity Operators:")
print(f"{'Operator':20} {'j':<5} {'k':<5} {'Result':<5}")
print(f"{'is':20} {j:<5} {k:<5} {j is k}")
print(f"{'is not':20} {j:<5} {k:<5} {j is not k} {'\n'}")

# Membership Operators
list = [10, 20, 30, "Sample"]
l = 10

print ("Membership Operators:")
print (f"List: {list}")
print(f"{'Operator':20} {'value':<5} {'Result':<5}")
print(f"{'in':20} {l:<5} {l in list}")
print(f"{'not in':20} {l:<5} {l not in list} {'\n'}")