import uuid
import pytest
from dundie.core import load
from .constants import PEOPLE_FILE


def setup_module():
    print()
    print("Runs before of this module tests.\n")


def teardown_module():
    print()
    print("Runs after this module tests.\n")


@pytest.fixture(scope="function", autouse=True)
def create_new_file(tmpdir):
    file_ = tmpdir.join("new_file.txt")
    file_.write("this is trash...")
    yield
    file_.remove()


@pytest.mark.unit
@pytest.mark.high
def test_load(request):
    """Test function load function."""

    request.addfinalizer(lambda: print("Finished!"))
    
    with open (f"unwanted_file-{uuid.uuid4()}.txt", "w") as file_:
        file_.write("useful data only for test!")

    assert len(load(PEOPLE_FILE)) == 2
    assert load(PEOPLE_FILE)[0][0] == 'J'


@pytest.mark.unit
@pytest.mark.high
def test_load2():
    """Test function load function."""

    with open (f"unwanted_file-{uuid.uuid4()}.txt", "w") as file_:
        file_.write("useful data only for test!")

    assert len(load(PEOPLE_FILE)) == 2
    assert load(PEOPLE_FILE)[0][0] == 'J'
