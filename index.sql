CREATE INDEX distinct_index ON sys_district(d_w_id,id);

CREATE INDEX customer_index ON sys_customer(c_w_id,c_d_id,id);

CREATE INDEX history_index ON sys_history(h_c_w_id,h_c_d_id,h_c_id);

CREATE INDEX newOrder_index ON sys_new_order(no_w_id,no_d_id,id);

CREATE INDEX order_index ON sys_order(o_w_id,o_d_id,id);


CREATE INDEX orderLine_index ON sys_order_line(ol_w_id,ol_d_id,ol_o_id,ol_number);

 
CREATE INDEX stock_index ON sys_stock(s_dist_one,s_i_id);