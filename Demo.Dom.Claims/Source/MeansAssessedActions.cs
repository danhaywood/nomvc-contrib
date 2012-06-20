using NakedObjects;

//Namespace must match that of the auto-generated partial class
namespace Demo.Dom.Claims
{
    public class MeansAssessedActions
    {

        public IDomainObjectContainer Container { set; protected get; }

        public IMeansAssessed DoStuffWith(IMeansAssessed meansAssessed)
        {
            return meansAssessed;
        }
      
    }

}