using System.Linq;
using NakedObjects;

//Namespace must match that of the auto-generated partial class
namespace Demo.Dom.Claims
{
    //Use this partial class to define actions for the Employer class.
    //Also for methods to enrich the behaviour of properties - such as Validate,
    //Default, or Choices and for class-level attributes such as <IconName>.
    public class ClaimFactory 
    {

        public IDomainObjectContainer Container { set; protected get; }

        public Claim NewFreeScooterClaim(string claimName)
        {
            var claim = Container.NewTransientInstance<FreeScooterClaim>();
            return SaveClaim(claim, claimName, "Free Scooter");
        }

        public Claim NewFreeBusPassClaim(string claimName)
        {
            var claim = Container.NewTransientInstance<FreeBusPassClaim>();
            return SaveClaim(claim, claimName, "Free Bus Pass");
        }

        public Claim NewFreeSchoolMealsClaim(string claimName)
        {
            var claim = Container.NewTransientInstance<FreeSchoolMealsClaim>();
            return SaveClaim(claim, claimName, "Free School Meals");
        }

        private Claim SaveClaim(Claim claim, string claimName, string type)
        {
            claim.Type = type;
            Claim claim1 = claim;
            claim1.Name = claimName;

            // nasty to have to do, but the identity of the claim isn't available to us.
            var nextId = (from c in Container.Instances<Claim>() orderby c.Id descending select c.Id).FirstOrDefault() + 1;
            claim1.Id = nextId;

            Container.Persist(ref claim1);

            return claim1;
        }


        public IQueryable<Claim> AllClaims()
        {
            return Container.Instances<Claim>();
        }

        public IQueryable<Claim> AllFreeScooterClaims()
        {
            return Container.Instances<FreeScooterClaim>();
        }

        public IQueryable<Claim> AllFreeBusPassClaims()
        {
            return Container.Instances<FreeBusPassClaim>();
        }

        public IQueryable<Claim> AllFreeSchoolMealsClaims()
        {
            return Container.Instances<FreeSchoolMealsClaim>();
        }

    }

}