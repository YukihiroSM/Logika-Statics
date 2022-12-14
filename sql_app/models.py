from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Float
from sqlalchemy.orm import relationship

from .database import Base


class Group(Base):
    __tablename__ = "home_group"
    id = Column(Integer, primary_key=True, index=True)
    group_id = Column(String, index=True, )
    group_name = Column(String)
    group_location = Column(String)  # should be a foreign key
    group_teacher = Column(String)  # should be a foreign key
    group_manager = Column(String)  # should be a foreign key
    group_course = Column(String)  # Should be a foreign key
    report_date_start = Column(String)
    report_date_end = Column(String)
    total = Column(Integer, nullable=True)
    attended = Column(Integer, nullable=True)


class Payment(Base):
    __tablename__ = "home_payment"
    id = Column(Integer, primary_key=True, index=True)
    group_manager = Column(String)
    client_name = Column(String)
    client_lms_id = Column(String)
    group_course = Column(String)
    bussiness = Column(String)
    report_date_start = Column(String, nullable=True)
    report_date_end = Column(String, nullable=True)


class Location(Base):
    __tablename__ = "home_location"
    id = Column(Integer, primary_key=True, index=True)
    standart_name = Column(String)
    lms_location_name = Column(String)
    client_manager = Column(String)
    territorial_manager = Column(String)
    regional_manager = Column(String)
    tutor = Column(String)
    region = Column(String)


class Report(Base):
    __tablename__ = "home_report"
    id = Column(Integer, primary_key=True, index=True)
    location_name = Column(String)
    region = Column(String)
    total = Column(Integer)
    attended = Column(Integer)
    payments = Column(Integer)
    conversion = Column(Float)
    students_without_amo = Column(String)
    territorial_manager = Column(String)
    start_date = Column(String)
    end_date = Column(String)
    business = Column(String)
    regional_manager = Column(String)
    client_manager = Column(String)
    tutor = Column(String)


class StudentAMORef(Base):
    __tablename__ = "home_studentamoref"
    id = Column(Integer, primary_key=True, index=True)
    lms_id = Column(String)
    amo_id = Column(String, nullable=True)
    group_id = Column(String)
    attended = Column(String)
    report_start = Column(String)
    report_end = Column(String)


class Issue(Base):
    __tablename__ = "home_issue"
    id = Column(Integer, primary_key=True, index=True)
    issue_type = Column(String)
    report_start = Column(String)
    report_end = Column(String)
    issue_description = Column(String)
    issue_status = Column(String)
    issue_priority = Column(String)
    issue_roles = Column(String)
    issue_header = Column(String, nullable=True)
    issue_data = Column(String, nullable=True)
