from manim import *

class GraphAreaPlot0(Scene):
    def construct(self):
        ax = Axes(
            x_range=[0, 1.2],
            y_range=[0, 3],
            axis_config={"include_numbers": True}
        )

        labels = ax.get_axis_labels()

        titulo = MathTex(r"f(x)=2-2x^2").shift(4.5*RIGHT).shift(DOWN)

        curve_1 = ax.plot(lambda x: 
         2 - 2*x ** 2, x_range=[0, 1], color=BLUE_C)
        
        curve_2 = ax.plot(lambda x: 
         2.0+0.0*x, x_range=[0, .8], color=YELLOW)
        label_h = MathTex("h", color=YELLOW).shift(3.5*DL).shift(.5*LEFT)

        label_zero = MathTex("0", color=YELLOW).next_to(label_h, 7*LEFT)

        #line_2 = Line((-6,1,0),(2,1,0), color=YELLOW)

        titulo_2 = MathTex(r"f(x) \approx f_{0}").shift(1.5*UP).shift(2*LEFT)

        titulo_3 = MathTex(r"[0,h]").next_to(titulo_2, 3*RIGHT)
        riemann_area = ax.get_riemann_rectangles(curve_1, x_range=[0.0, 0.2], dx=0.2, color=BLUE_A, fill_opacity=0.5)
        #area = ax.get_area(curve_2, [2, 3], bounded_graph=curve_1, color=GREY, opacity=0.5)

        self.add(ax, labels,curve_1, riemann_area, titulo, label_h, label_zero, titulo_2, titulo_3, curve_2#curve_2, area, line_2
        )

class GraphAreaPlot1(Scene):
    def construct(self):
        ax = Axes(
            x_range=[0, 1.2],
            y_range=[0, 3],
            axis_config={"include_numbers": True}
        )

        labels = ax.get_axis_labels()

        titulo = Tex("Retângulo à esq.").to_edge(UP)
        curve_1 = ax.plot(lambda x: 
         2 - 2*x ** 2, x_range=[0, 1], color=BLUE_C)
        #curve_2 = ax.plot(             lambda x: 0.8 * x ** 2 - 3 * x + 4,             x_range=[0, 4],             color=GREEN_B,         )
        label_h = MathTex("0+(1)h", color=YELLOW).shift(3.5*DL).shift(1.45*LEFT).scale(.8)

        label_h2 = MathTex("0+(2)h", color=YELLOW).next_to(label_h, 2*RIGHT).scale(.8)

        label_h3 = MathTex("0+(3)h", color=YELLOW).next_to(label_h, 10*RIGHT).scale(.8)

        label_h4 = MathTex("0+(4)h", color=YELLOW).next_to(label_h, 18*RIGHT).scale(.8)

        label_h5 = MathTex("0+(5)h", color=YELLOW).next_to(label_h4, 1.7*RIGHT).scale(.8)

        #line_1 = ax.get_vertical_line(ax.input_to_graph_point(0.2, curve_1), color=YELLOW)

        line_2 = Line((-6,1,0),(-4,1,0), color=YELLOW)

        line_3 = Line((-4,.8,0),(-2,.8,0), color=YELLOW)

        line_4 = Line((-2,.35,0),(0,.35,0), color=YELLOW)

        line_5 = Line((0,-.45,0),(2,-.45,0), color=YELLOW)

        line_6 = Line((2,-1.58,0),(4,-1.58,0), color=YELLOW)

        riemann_area = ax.get_riemann_rectangles(curve_1, x_range=[0.0, 1.0], dx=0.2, color=BLUE_A, fill_opacity=0.5)
        #area = ax.get_area(curve_2, [2, 3], bounded_graph=curve_1, color=GREY, opacity=0.5)

        self.add(ax, labels,curve_1, riemann_area, titulo, label_h, label_h2, label_h3, label_h4, label_h5, line_2, line_3, line_4, line_5, line_6
        )

class GraphAreaPlot2(Scene):
    def construct(self):
        ax = Axes(
            x_range=[0, 1.2],
            y_range=[0, 3],
            x_axis_config={"numbers_to_include": [0, 1]},
            tips=False,
        )

        labels = ax.get_axis_labels()

        titulo = MathTex(r"f(x)=2-2x^2").shift(.5*LEFT).shift(1.5*DOWN)
        curve_1 = ax.plot(lambda x: 
         2 - 2*x ** 2, x_range=[0, 1], color=BLUE_C)
        curve_2 = ax.plot(lambda x: 2
         -.405*x, x_range=[0, .8], color=RED)
        #curve_2 = ax.plot(             lambda x: 0.8 * x ** 2 - 3 * x + 4,             x_range=[0, 4],             color=GREEN_B,         )
        label_hplus = MathTex("h", color=YELLOW).shift(3.5*DL).shift(.5*LEFT)

        label_h = MathTex("-h", color=YELLOW).next_to(label_hplus, 7*LEFT)

        label_zero = MathTex("0", color=YELLOW).next_to(label_hplus, 2.85*LEFT)

        line_1 = ax.get_vertical_line(ax.input_to_graph_point(0.1, curve_1), color=YELLOW)

        titulo_2 = MathTex(r"f(x) \approx f_{0} + mx").shift(1*UP).shift(0.5*RIGHT)

        titulo_3 = MathTex(r"[-h,h]").next_to(titulo_2, 3*RIGHT)

        titulo_4 = MathTex(r"m =\left.\frac{df(x)}{dx}\right|_{x=x_{0}}",r"=\frac{f_{0} - f_{-1}}{h}", r"=\frac{f_{1} - f_{0}}{h}").to_edge(UR)

        titulo_5 = MathTex(r"f_{-1}").next_to(curve_2, UP).shift(4.5*LEFT).shift(.1*DOWN)
        titulo_6 = MathTex(r"f_{0}").next_to(titulo_5, 3.7*RIGHT).shift(.1*DOWN)
        titulo_7 = MathTex(r"f_{1}").next_to(titulo_6, 2.5*RIGHT).shift(.1*DOWN)
        #riemann_area = ax.get_riemann_rectangles(curve_1, x_range=[0.0, 0.2], dx=0.2, color=BLUE_A, fill_opacity=0.5)
        left_botton = (-6,-3, 0)
        left_top = (-6,1.015, 0)
        right_top = (-4,.855, 0)
        right_botton = (-4, -3, 0)
        area = Polygon(left_botton, left_top, right_top, right_botton, left_botton)
        area.set_fill(color=BLUE_A, opacity=.5)
        area.set_stroke(opacity=.0)

        self.add(ax, labels,curve_1, titulo, label_hplus, label_h, label_zero, titulo_2, titulo_3, area, line_1, titulo_4, titulo_5, titulo_6, titulo_7, curve_2#, riemann_area#curve_2, line_2
        )

class GraphAreaPlot3(Scene):
    def construct(self):
        ax = Axes(
            x_range=[0, 1.2],
            y_range=[0, 3],
            x_axis_config={"numbers_to_include": [0, 1]},
            tips=False,
        )

        titulo = Tex("Método dos trapézios").to_edge(UP)

        labels = ax.get_axis_labels()

        curve_1 = ax.plot(lambda x: 
         2 - 2*x ** 2, x_range=[0, 1], color=PURPLE)

        curve_2 = ax.plot(lambda x: 2
         -.405*x, x_range=[0, .2], color=RED)

        curve_3 = ax.plot(lambda x: 2.155
         -1.1825*x, x_range=[.2, .4], color=RED)

        curve_4 = ax.plot(lambda x: 2.48
         -2*x, x_range=[.4, .6], color=RED)

        curve_5 = ax.plot(lambda x: 2.96
         -2.8*x, x_range=[.6, .8], color=RED)

        curve_6 = ax.plot(lambda x: 3.58
         -3.58*x, x_range=[.8, 1.0], color=RED)

        label_h1 = MathTex("a+(1)h", color=YELLOW).shift(3.3*DL).shift(1.6*LEFT).scale(.7)

        label_h2 = MathTex("a+(2)h", color=YELLOW).next_to(label_h1, 1.8*RIGHT).scale(.7)

        label_h3 = MathTex("a+(3)h", color=YELLOW).next_to(label_h2, 1.8*RIGHT).scale(.7)

        label_h4 = MathTex("a+(4)h", color=YELLOW).next_to(label_h3, 1.8*RIGHT).scale(.7)

        label_h5 = MathTex("a+(5)h", color=YELLOW).next_to(label_h4, 1.8*RIGHT).scale(.7)

        line_1 = ax.get_vertical_line(ax.input_to_graph_point(0.1, curve_1), color=YELLOW)

        line_2 = ax.get_vertical_line(ax.input_to_graph_point(0.3, curve_1), color=YELLOW)

        line_3 = ax.get_vertical_line(ax.input_to_graph_point(0.5, curve_1), color=YELLOW)

        line_4 = ax.get_vertical_line(ax.input_to_graph_point(0.7, curve_1), color=YELLOW)

        line_5 = ax.get_vertical_line(ax.input_to_graph_point(0.9, curve_1), color=YELLOW)

        #riemann_area = ax.get_riemann_rectangles(curve_1, x_range=[0.2, 0.4], dx=0.2, color=BLUE_A, fill_opacity=0.5)

        #Trapézio 1
        left_botton = (-6,-3, 0)
        left_top = (-6,1.015, 0)
        right_top = (-4,.855, 0)
        right_botton = (-4, -3, 0)
        area = Polygon(left_botton, left_top, right_top, right_botton, left_botton)
        area.set_fill(color=BLUE_A, opacity=.5)
        area.set_stroke(opacity=.0)

        #Trapézio 2
        left_botton2 = (-4,-3, 0)
        left_top2 = (-4,.838, 0)
        right_top2 = (-2,.36, 0)
        right_botton2 = (-2, -3, 0)
        area2 = Polygon(left_botton2, left_top2, right_top2, right_botton2, left_botton2)
        area2.set_fill(color=BLUE_B, opacity=.5)
        area2.set_stroke(opacity=.0)

        #Trapézio 3
        left_botton3 = (-2,-3, 0)
        left_top3 = (-2,.36, 0)
        right_top3 = (0,-.44, 0)
        right_botton3 = (0, -3, 0)
        area3 = Polygon(left_botton3, left_top3, right_top3, right_botton3, left_botton3)
        area3.set_fill(color=BLUE_C, opacity=.5)
        area3.set_stroke(opacity=.0)

        #Trapézio 4
        left_botton4 = (0,-3, 0)
        left_top4 = (0,-.44, 0)
        right_top4 = (2,-1.56, 0)
        right_botton4 = (2, -3, 0)
        area4 = Polygon(left_botton4, left_top4, right_top4, right_botton4, left_botton4)
        area4.set_fill(color=BLUE_D, opacity=.5)
        area4.set_stroke(opacity=.0)

        #Trapézio 5
        left_botton5 = (2,-3, 0)
        left_top5 = (2,-1.56, 0)
        right_botton5 = (4, -3, 0)
        area5 = Polygon(left_botton5, left_top5, right_botton5, left_botton5)
        area5.set_fill(color=BLUE_E, opacity=.5)
        area5.set_stroke(opacity=.0)

        self.add(ax, labels,curve_1, titulo, label_h3, label_h2, label_h1, area, line_1, curve_2, curve_3, area2, line_2, area3, curve_4, line_3, label_h4, area4, curve_5, label_h5, line_4, area5, curve_6, line_5#,riemann_area
        )
#CLI: manim -s scene.py --format png