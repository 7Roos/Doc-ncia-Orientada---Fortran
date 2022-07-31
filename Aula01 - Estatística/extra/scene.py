from manim import *

class NumberLineExample(Scene):
    def construct(self):
        self.camera.background_color = WHITE
        l0 = NumberLine(
            x_range=[0, 8, 4],
            length=10,
            color=BLUE_E,
            include_numbers=False,
            label_direction=UP,
        )
        l0_text0 = Tex("0cm", color = "BLACK").next_to(l0, 1.2*UP).shift(4.8*LEFT)
        l0_text1 = Tex("1cm", color = "BLACK").next_to(l0, 1.2*UP).shift(0*RIGHT)
        l0_text2 = Tex("2cm", color = "BLACK").next_to(l0, 1.2*UP).shift(5*RIGHT)
        l1 = NumberLine(
            x_range=[0, 8, 2],
            length=10,
            color=ORANGE,
            include_numbers=False,
            label_direction=UP,
        )
        l1_text1 = Tex("5mm", color = "BLACK").next_to(l1, 1.2*UP).shift(2.5*LEFT).scale(.5)
        l1_text3 = Tex("15mm", color = "BLACK").next_to(l1, 1.2*UP).shift(2.5*RIGHT).scale(.5)

        l2 = NumberLine(
            x_range=[0, 20, 1],
            length=10,
            color=BLUE_E,
            include_numbers=False,
            label_direction=UP,
        )

        self.add(l0, l1, l2)
        self.add(l0_text0, l0_text1, l0_text2)
        self.add(l1_text1, l1_text3)
2