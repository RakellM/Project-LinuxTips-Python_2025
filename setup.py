from setuptools import setup, find_packages


setup (
    name="dundie",
    version="0.1.0",
    description="Reward Point System for Dunder Mifflin",
    author="Raquel Marques",
    packages=find_packages(),
    entry_points={
        "console_scripts": [
            "dundie= dundie.__main__:main"
        ]
    },
    install_requires=[],
    extras_require={
        "test": [
            "pytest"
        ],
        "dev": [
            "ipdb",
            "ipython",
            "pudb"
        ]
    }
)
