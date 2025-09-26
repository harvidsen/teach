from asciimatics.renderers import FigletText, Fire
from asciimatics.scene import Scene
from asciimatics.screen import Screen
from asciimatics.effects import Print


def demo(screen):
    scenes = []

    effects = [
        Print(
            screen,
            Fire(
                screen.height,
                80,
                "*" * 70,
                0.8,
                60,
                screen.colours,
                bg=screen.colours >= 256,
            ),
            0,
            speed=0.5,
            transparent=False,
        ),
        Print(
            screen,
            FigletText("Yeah!", "banner3"),
            (screen.height - 4) // 2,
            colour=Screen.COLOUR_BLACK,
            speed=1,
        ),
    ]
    scenes.append(Scene(effects, 40))

    screen.play(scenes, stop_on_resize=True, repeat=False)


def run_flame_show():
    Screen.wrapper(demo)


if __name__ == "__main__":
    run_flame_show()
