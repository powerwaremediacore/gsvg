import gi
gi.require_version ('GSvg','0.4')
from gi.repository import Gio, GSvg

svg = GSvg.GsSvg ()
t = svg.create_text ("Hello, out there", "250","150", None, None, None)
t.set_font_family ("Verdana")
t.set_font_size ("55")
t.set_fill ("blue")
svg.append_child (t)
r = svg.create_rect ("1", "1", "998", "298")
r.set_fill("none")
r.set_stroke ("blue")
r.set_stroke_width ("2")
svg.append_child (r)

f = Gio.File.new_for_path ("text.svg")
svg.write_file (f)

