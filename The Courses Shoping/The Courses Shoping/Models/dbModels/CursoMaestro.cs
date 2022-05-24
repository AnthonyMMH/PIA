using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    [Table("CursoMaestro")]
    public partial class CursoMaestro
    {
        [Key]
        public int IdCurso { get; set; }
        [Key]
        public int IdMaestro { get; set; }

        [ForeignKey(nameof(IdCurso))]
        [InverseProperty(nameof(Curso.CursoMaestros))]
        public virtual Curso IdCursoNavigation { get; set; }
        [ForeignKey(nameof(IdMaestro))]
        [InverseProperty(nameof(Maestro.CursoMaestros))]
        public virtual Maestro IdMaestroNavigation { get; set; }
    }
}
