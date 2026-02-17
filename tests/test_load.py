import pytest
from dundie.core import load
from .constants import PEOPLE_FILE


@pytest.mark.unit
@pytest.mark.high
def test_load_positive_has_2_people(request):
    """Test function load function."""
<<<<<<< HEAD
    assert len(load(PEOPLE_FILE)) == 2
=======
    assert len(load(PEOPLE_FILE)) == 3
>>>>>>> 88fae6e22e2772fd7228ac3b414a174e6502930a


@pytest.mark.unit
@pytest.mark.high
def test_load_positive_first_name_starts_with_j(request):
    """Test function load function."""
    assert load(PEOPLE_FILE)[0][0] == 'J'
