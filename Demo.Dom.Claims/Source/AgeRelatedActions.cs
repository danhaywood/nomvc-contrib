using NakedObjects;

//Namespace must match that of the auto-generated partial class
namespace Demo.Dom.Claims
{
    public class AgeRelatedActions
    {

        public IDomainObjectContainer Container { set; protected get; }

        public IAgeRelated DoStuffWith(IAgeRelated ageRelated)
        {
            return ageRelated;
        }
      
    }

}