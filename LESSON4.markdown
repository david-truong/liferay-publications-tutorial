# Publications Tutorial

## Lesson 3

In this lesson we will cover when to use @CTAware.

@CTAware is an annotation that can be used on a class or a method.  It must be used with @Transactional but in most cases we do not need to apply the @Transaction because it has been applied already.

When we apply change tracking with Service Builder, we automatically apply @CTAware to the service.

Sometimes though we must manually apply @CTAware.

### Scenario 1

You have a change tracked entity.  In most cases we would use a SafeClosable to give ourselves the flexibility to decide if a method needs to run in Production or a Publication. But in certain cases, you would like one method of it to always execute in Production.  In this case you could use @CTAware(onProduction=true) on the method.  

### Scenario 2

You have a service which is the entry point for a complex transaction i.e. like WorkflowManagerImpl.  This service is not created with Service Builder but manually created.  It will create/update/delete a number of entities.  It is important to apply @CTAware to the class or it will fail when called inside a publication.

This is because the CT framework does not allow a transaction to take place in a publication unless the whole chain is CTAware.

### Scenario 3

The last scenario is the most dangerous.  We apply @CTAware to a service builder entity that is not change tracked.  This is very similar to apply @CTAware(onProduction=true) but in the background something slightly different takes place.  I would advise to never do this.