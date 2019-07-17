package basket;

public class Basket {
		private String customer_id;
		private String stuff_id;
		
		public Basket(String customer_id, String stuff_id) {
			this.customer_id = customer_id;
			this.stuff_id = stuff_id;
		}
		public void setCustomerId(String customer_id) {
			this.customer_id = customer_id;
		}
		public String getCustomerId() {
			return customer_id;
		}
		public void setStuffId(String stuff_id) {
			this.stuff_id = stuff_id;
		}
		public String getStuffId() {
			return stuff_id;
		}
		
}