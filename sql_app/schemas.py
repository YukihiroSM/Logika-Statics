from typing import Union

from pydantic import BaseModel
from pydantic.schema import Optional


class GroupBase(BaseModel):
    group_id: str
    group_name: str
    group_course: str
    group_manager: str
    report_date_start: str
    report_date_end: str


class GroupCreate(GroupBase):
    group_id: str
    group_name: str
    group_location: str
    group_teacher: str
    group_manager: str
    group_course: str
    report_date_start: str
    report_date_end: str


class Group(GroupBase):
    id: int
    group_id: str
    group_name: str
    group_location: str
    group_teacher: str
    group_manager: str
    group_course: str
    report_date_start: str
    report_date_end: str
    total: int
    attended: int

    class Config:
        orm_mode = True


class PaymentBase(BaseModel):
    group_manager: str
    client_name: str
    client_lms_id: str
    group_course: str
    bussiness: str
    report_date_start: str
    report_date_end: str


class PaymentCreate(PaymentBase):
    group_manager: str
    client_name: str
    client_lms_id: str
    group_course: str
    bussiness: str
    report_date_start: str
    report_date_end: str


class Payment(PaymentBase):
    id: str
    group_manager: str
    client_name: str
    client_lms_id: str
    group_course: str
    bussiness: str
    report_date_start: str
    report_date_end: str

    class Config:
        orm_mode = True


class LocationBase(BaseModel):
    standart_name: str
    lms_location_name: str
    client_manager: str
    region: str
    territorial_manager: str


class LocationCreate(BaseModel):
    lms_location_name: str
    region: str
    territorial_manager: str


class Location(LocationBase):
    id: str
    standart_name: str
    lms_location_name: str
    client_manager: str
    region: str
    territorial_manager: str

    class Config:
        orm_mode = True


class ReportBase(BaseModel):
    location_name: str
    region: str
    total: int
    attended: int
    payments: int
    conversion: float
    students_without_amo: str
    territorial_manager: str
    start_date: str
    end_date: str


class ReportCreate(ReportBase):
    location_name: str
    region: str
    total: int
    attended: int
    payments: int
    conversion: float
    students_without_amo: str
    territorial_manager: str
    start_date: str
    end_date: str


class Report(ReportBase):
    id: str
    location_name: str
    region: str
    total: int
    attended: int
    payments: int
    conversion: float
    students_without_amo: str
    territorial_manager: str
    start_date: str
    end_date: str

    class Config:
        orm_mode = True


class StudentBase(BaseModel):
    lms_id: str
    student_name: str
    group_id: str


class StudentCreate(StudentBase):
    lms_id: str
    student_name: str
    group_id: str
    group_location: str
    region: str


class Student(StudentBase):
    id: int
    lms_id: str
    student_name: str
    group_id: str
    group_location: str
    amo_id: str
    region: str

    class Config:
        orm_mode = True


class GlobalGroupBase(BaseModel):
    group_id: str
    group_name: str
    group_manager: str
    group_region: str


class GlobalGroupCreate(GlobalGroupBase):
    group_id: str
    group_name: str
    group_location: str
    group_teacher: str
    group_manager: str
    group_region: str


class GlobalGroup(GlobalGroupBase):
    id: int
    group_id: str
    group_name: str
    group_location: str
    group_teacher: str
    group_manager: str
    group_region: str

    class Config:
        orm_mode = True


class StudentAMORefBase(BaseModel):
    lms_id: str
    amo_id: str
    group_id: str
    attended: str
    report_start: str
    report_end: str


class StudentAMORefCreate(StudentAMORefBase):
    lms_id: str
    amo_id: str
    group_id: str
    attended: str
    report_start: str
    report_end: str


class StudentAMORef(StudentAMORefBase):
    id: int
    lms_id: str
    amo_id: Optional[str]
    group_id: str
    attended: str
    report_start: str
    report_end: str

    class Config:
        orm_mode = True