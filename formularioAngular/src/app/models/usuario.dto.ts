export class StudentDto {
    constructor(
        public nombre: string,
        public apellidos: string,
        public nif: string,
        public email: string,
        public telefono: string,
        public sexo: string,
        public conociaLaPagina: string,
        public contrasenha: string,
        public confirmarContrasnha: string
    ){}
}