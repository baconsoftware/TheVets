namespace TheVetsWebsite.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialModel1 : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Animals", "maxsize", c => c.Single(nullable: false));
            DropColumn("dbo.Animals", "maxize");
        }
        
        public override void Down()
        {
            AddColumn("dbo.Animals", "maxize", c => c.Single(nullable: false));
            DropColumn("dbo.Animals", "maxsize");
        }
    }
}
