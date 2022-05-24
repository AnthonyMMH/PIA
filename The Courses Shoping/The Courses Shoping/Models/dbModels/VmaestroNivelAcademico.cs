using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    [Keyless]
    public partial class VmaestroNivelAcademico
    {
        public int IdMaestro { get; set; }
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }
        public bool? Género { get; set; }
        public int NivelAcademico { get; set; }
        [Required]
        [StringLength(50)]
        public string Descripcion { get; set; }
        public string Imagen { get; set; }
        [Required]
        [StringLength(200)]
        public string Curriculum { get; set; }
    }
}
