from dataclasses import dataclass
from datatable_errors import DataTableDoesNotExist

class DataTableRepository:
    """
    __data_tables = {
        0: [ <- seria la iteración
            { 
                "id": "general.data.csv", <- el nombre del archivo buscado
                "values": "" <- la dataclass
            },
            {
                "id": "general2.data.csv", <- el nombre del archivo buscado
                "values": "" <- la dataclass
            }
        ]
    }
    Se guarda asi porque la iteración durante una ejecución
    es constante y esto ayuda a que no se generen nuevas
    instancias de dataclass cuando se quiere obtener la misma
    dataclass según el nombre
    """
    __data_tables: dict = {}

    @classmethod
    def save(cls, iteration: int, name: str, data_class: dataclass):
        dataclass_iteration = cls.__data_tables.get(iteration)
        if dataclass_iteration is None:
            cls.__data_tables[iteration] = [
                {
                    "id": name,
                    "data": data_class
                }
            ]
            return 
        cls.__data_tables[iteration].append(
            {
                "id": name,
                "data": data_class
            }
        )

    @classmethod
    def find(cls, iteration: int, filename: str):
        data_info = cls.__data_tables.get(iteration)
        if data_info is None:
            return

        data_class_info = list(filter(
            lambda data_class: data_class["id"] == filename,
            data_info
        ))
        if not data_class_info:
            raise DataTableDoesNotExist(
                f" El archivo {filename} no fue encontrado en el repositorio " +
                f" de la iteración {iteration}"
            )

        return data_class_info[0]["data"]

    @classmethod
    def find_all(cls):
        return cls.__data_tables
