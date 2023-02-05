import struct
import codecs
from colour import Color

# Hex to X
def nohash(hex):
  return hex.lstrip('#')

def to_rgb(hex):
  return struct.unpack('BBB', codecs.decode(nohash(hex), 'hex'))

def to_chrome(hex):
  return '[{}]'.format(', '.join(map(str, to_rgb(hex))))

# alpha: 0 - 255
def to_apple(hex, alpha=0):
  return '{{{}}}'.format(', '.join(map(
    lambda x: str(x * 257), to_rgb(hex) + (alpha,)
  )))

def lighten(hex, offset=0.2):
  c = Color(hex)
  lum = clamp(c.luminance + offset, 0, 1)
  c.luminance = lum
  return c.hex_l

def darken(hex, offset=0.2):
  c = Color(hex)
  lum = clamp(c.luminance - offset, 0, 1)
  c.luminance = lum
  return c.hex_l

def clamp(n, minn, maxn):
  return max(min(maxn, n), minn)
