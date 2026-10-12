"""Demo tests exercise the published openriak package against codecs."""

from openriak import Config, OpenRiak


def test_package_exports():
    assert OpenRiak.__name__ == "OpenRiak"
    assert Config.__name__ == "Config"
