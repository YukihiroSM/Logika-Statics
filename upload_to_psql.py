from sqlalchemy import create_engine

from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import declarative_base

from sqlalchemy import create_engine
from sqlalchemy_utils import database_exists, create_database

engine = create_engine("postgresql://admin:password@localhost/postgres")
if not database_exists(engine.url):
    create_database(engine.url)

Base = declarative_base()


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    fullname = Column(String)
    nickname = Column(String)
    def __repr__(self):
       return "<User(name='%s', fullname='%s', nickname='%s')>" % (
                            self.name, self.fullname, self.nickname)


Base.metadata.create_all(engine)
ed_user = User(name='ed', fullname='Ed Jones', nickname='edsnickname')

from sqlalchemy.orm import sessionmaker
Session = sessionmaker(bind=engine)
session = Session()

session.add(ed_user)
session.add(ed_user)
session.add(ed_user)

print(session.query(User).filter_by(name='ed').all())