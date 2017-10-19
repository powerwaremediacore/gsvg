import gi
gi.require_version ('GSvg','0.4')
from gi.repository import Gio, GSvg

svg = GSvg.GsSvg ()
r = svg.create_rect ("0cm", "0cm", "9mm","9mm", None, None)
svg.append_child (r)

f = Gio.File.new_for_path ("rect.svg")
svg.write_file (f)

