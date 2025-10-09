from ashow.yeah import get_motivational_word


def test_motivationalness():
    word = get_motivational_word()
    assert "!" in word, "Not motivating enough"
