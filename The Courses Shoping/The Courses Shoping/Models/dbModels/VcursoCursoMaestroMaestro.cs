using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    [Keyless]
    public partial class VcursoCursoMaestroMaestro
    {
        public int IdCurso { get; set; }
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }
        [Required]
        [StringLength(20)]
        public string Precio { get; set; }
        [Required]
        [StringLength(200)]
        public string Descripcion { get; set; }
        [Required]
        public string Imagenes { get; set; }
        public int IdMaestro { get; set; }
        [Required]
        [StringLength(50)]
        public string Expr1 { get; set; }
        public bool? Género { get; set; }
        public int NivelAcademico { get; set; }
        public string Imagen { get; set; }
        [Required]
        [StringLength(200)]
        public string Curriculum { get; set; }
    }
}
