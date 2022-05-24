using Microsoft.AspNetCore.Identity;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace The_Courses_Shoping.Models.dbModels
{
    public class ApplicationUser : IdentityUser<int>
    {
        public ApplicationUser()
        {
            Cursos = new HashSet<Curso>();
        }
        public string Nombre { get; set; }
        [InverseProperty(nameof(Curso.IdCursoNavigation))]    
        public virtual ICollection<Curso> Cursos { get; set; }
    }
}
