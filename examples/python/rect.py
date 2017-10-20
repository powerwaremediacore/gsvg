import gi
gi.require_version ('GSvg','0.4')
from gi.repository import Gio, GSvg

svg = GSvg.GsSvg ()
r = svg.create_rect ("0mm", "0mm", "20mm","20mm", None, None)
r.set_fill("none")
r.set_stroke ("black")
r.set_stroke_width ("1mm")
svg.append_child (r)

f = Gio.File.new_for_path ("rect.svg")
svg.write_file (f)

