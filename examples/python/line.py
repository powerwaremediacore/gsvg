import gi
gi.require_version ('GSvg','0.4')
from gi.repository import Gio, GSvg

svg = GSvg.GsSvg ()
l = svg.create_line ("0cm", "0cm", "50mm","50mm")
l.get_style().set_value ("fill:none;stroke-width:3.77952756;stroke-miterlimit:4;stroke-dasharray:none;stroke:#000000;stroke-opacity:1")
svg.append_child (l)

f = Gio.File.new_for_path ("line.svg")
svg.write_file (f)

