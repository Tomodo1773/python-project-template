import main


def test_main_prints_hello(capsys):
    main.main()
    captured = capsys.readouterr()
    assert "Hello, World!" in captured.out
