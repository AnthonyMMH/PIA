using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace The_Courses_Shoping.Models.dbModels
{
    [Table("NivelAcademico")]
    public partial class NivelAcademico
    {
        public NivelAcademico()
        {
            Maestros = new HashSet<Maestro>();
        }

        [Key]
        public int IdNivelAcademico { get; set; }
        [Required]
        [StringLength(50)]
        public string Descripcion { get; set; }

        [InverseProperty(nameof(Maestro.NivelAcademicoNavigation))]
        public virtual ICollection<Maestro> Maestros { get; set; }
    }
}
