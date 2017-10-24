import gi
gi.require_version ('GSvg','0.4')
from gi.repository import Gio, GSvg
dsvg = GSvg.GsDocument ()
svg = dsvg.add_svg (None,None,"10cm","3cm","0 0 1000 300", None, "Example tspan01 - using tspan to change visual attributes")

g = svg.add_g ()
g.set_font_family ("Verdana")
g.set_font_size ("45")
svg.append_child (g)
t = svg.create_text (None,"200","150", None, None, None)
g.append_child (t)
t.set_fill ("blue")
t.add_text ("You are ")
ts = t.add_span ("not")
ts.set_font_weight ("bold")
ts.set_fill ("red")
t.add_text (" a banana")

r = svg.create_rect ("1","1","998","298")
svg.append_child (r)
r.set_fill ("none")
r.set_stroke("blue")
r.set_stroke_width("2")

f = Gio.File.new_for_path ("svg-text-span.svg")
svg.write_file (f)

