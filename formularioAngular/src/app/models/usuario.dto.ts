export class StudentDto {
    constructor(
        public nombre: string,
        public apellidos: string,
        public nif: string,
        public email: string,
        public telefono: string,
        public sexo: string,
        public motivo: string,
        public password: string
    ){}
}