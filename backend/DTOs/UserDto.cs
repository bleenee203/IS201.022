using PetShop.Models;
using System.ComponentModel.DataAnnotations;

namespace PetShop.DTOs
{
    public class UserDto
    {
        public string UserName { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
    }
}
