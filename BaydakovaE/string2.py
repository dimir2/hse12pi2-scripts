import math
# D. verbing
def verbing(s):
    if s.endswith('ing'):
        st=s+"ly"
    elif len(s) > 3:
        st=s+"ing"
    else:
        st=s
    return st

# E. not_bad
def not_bad(s):
    if s.find('not') > 0 and s.find('bad') > 0 and s.find('not') < s.find('bad'):
        st=s[:s.find('no')]+'good'
    else:
        st=s
    return st

# F. front_back
def front_back(a, b):
    cen= math.ceil  (len(a) / 2)
    cen2= math.ceil  (len(b) / 2)
    st=a[:cen]+b[:cen2]+a[cen:]+b[cen2:]
    return st

def test(got, expected):
  if got == expected:
    prefix = ' OK '
  else:
    prefix = '  X '
  print ('%s got: %s expected: %s' % (prefix, repr(got), repr(expected)))


def main():
  print ('verbing')
  test(verbing('hail'), 'hailing')
  test(verbing('swiming'), 'swimingly')
  test(verbing('do'), 'do')

  print
  print ('not_bad')
  test(not_bad('This movie is not so bad'), 'This movie is good')
  test(not_bad('This dinner is not that bad'), 'This dinner is good')
  test(not_bad('This tea is not hot'), 'This tea is not hot')
  test(not_bad("It's bad yet not"), "It's bad yet not")

  print
  print ('front_back')
  test(front_back('abcd', 'xy'), 'abxcdy')
  test(front_back('abcde', 'xyz'), 'abcxydez')
  test(front_back('Kitten', 'Donut'), 'KitDontenut')

if __name__ == '__main__':
  main()
