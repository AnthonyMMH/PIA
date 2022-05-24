using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    public partial class Maestro
    {
        public Maestro()
        {
            CursoMaestros = new HashSet<CursoMaestro>();
        }

        [Key]
        public int IdMaestro { get; set; }
        [Required]
        [StringLength(50)]
        public string Nombre { get; set; }
        public bool? Género { get; set; }
        public int NivelAcademico { get; set; }
        public string Imagen { get; set; }
        [Required]
        [StringLength(200)]
        public string Curriculum { get; set; }

        [ForeignKey(nameof(NivelAcademico))]
        [InverseProperty("Maestros")]
        public virtual NivelAcademico NivelAcademicoNavigation { get; set; }
        [InverseProperty(nameof(CursoMaestro.IdMaestroNavigation))]
        public virtual ICollection<CursoMaestro> CursoMaestros { get; set; }
    }
}
