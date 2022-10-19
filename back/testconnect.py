import json
import unittest
from api.alchemy.tables.main import SessionLocal

#Test de la connexion à la base de données
class TestConnection(unittest.TestCase):
    def test_connect(self):
        self.assertEquals(SessionLocal().connection().closed,False) #return False if connection happen without error


if __name__ == '__main__':
    unittest.main()
