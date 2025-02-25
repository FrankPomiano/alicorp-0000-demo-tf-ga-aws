using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Configuration;
using System.Diagnostics;
using Amazon.SimpleSystemsManagement;
using Amazon.SimpleSystemsManagement.Model;

namespace DemoBelcorp2.Controllers
{
    public class ValuesController : ApiController
    {
        EventLog log = new EventLog { Source = "WinContainerApp" };
        //string table = ConfigurationManager.AppSettings["tableName"];
        string AWSParameterStorePrefix = Environment.ExpandEnvironmentVariables(ConfigurationManager.AppSettings["AWSParameterStorePrefix"]);

        
        private string getTable()
        {
            var client = new AmazonSimpleSystemsManagementClient();

            var request = new GetParameterRequest()
            {
                Name = $"{AWSParameterStorePrefix}tableName"
            };

            var response = client.GetParameterAsync(request).GetAwaiter().GetResult();

            return response.Parameter.Value;
        }
        // GET api/values
        public IEnumerable<string> Get()
        {
            try
            {
                var table = getTable();
                log.WriteEntry($"Get All: Using table {table}", EventLogEntryType.Warning);
                if (table == "devTable")
                {
                    return new string[] { "values-update", "of", "dev", "table", table };
                }
                else if (table == "prodTable")
                {
                    return new string[] { "values", "of", "prod", "table", table };
                }
                else
                {
                    return new string[] { "values", "of", "no environment", "table", table };
                }
            } catch (Exception e)
            {
                log.WriteEntry(e.Message, EventLogEntryType.Error);
                throw e;
            }
        }

        // GET api/values/5
        public string Get(int id)
        {
            var table = getTable();
            log.WriteEntry($"Get with id {id}: Using table {table}", EventLogEntryType.Warning);
            return "value";
        }

        // POST api/values
        public void Post([FromBody] string value)
        {
            var table = getTable();
            log.WriteEntry($"save value {value}: Using table {table}", EventLogEntryType.Warning);
        }

        // PUT api/values/5
        public void Put(int id, [FromBody] string value)
        {
            var table = getTable();
            log.WriteEntry($"update id {id} with value {value}: Using table {table}", EventLogEntryType.Warning);
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
            var table = getTable();
            log.WriteEntry($"delete id {id}: Using table {table}", EventLogEntryType.Warning);
        }
    }
}
